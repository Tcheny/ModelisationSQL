# Les requêtes SQL:

## Afficher toutes les cards du user 1
```
SELECT c.id as 'cardId', c.name
    FROM users_cards_lists as ucl
    JOIN cards as c ON ucl.card_id = c.id
    WHERE ucl.user_id = 1
```

## Afficher tous les users qui ont des cards en lists 3
```
SELECT DISTINCT list_id as listId, u.id as userId,
    CONCAT(u.firstname,' ',u.lastname) as userName
    FROM users_cards_lists as ucl
    JOIN users as u On ucl.user_id = u.id
    WHERE ucl.list_id=3
```

## Pour plus de détail, ajouter, pour chaque utilisateur, le nom des cards qu’ils ont en liste 1
```
SELECT DISTINCT users.id,
CONCAT(users.firstname, ' ',users.lastname) as userName,
    GROUP_CONCAT(
    CONCAT('{"id":"', cards.id, '","name":"',cards.name,'"}')
    ) as cards
    FROM users_cards_lists
    JOIN users ON user_id = users.id
    JOIN cards ON card_id = cards.id
    WHERE list_id = 3
    GROUP BY user_id
```

## Afficher les cards avec les lists associés
