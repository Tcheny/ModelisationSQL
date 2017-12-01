# Les requêtes SQL:

## Afficher toutes les lists

```
SELECT * FROM lists
```

## Afficher le nom de la list dans laquelle se trouve la card 3

*Solution 1 avec sous requête*
```
SELECT name
    FROM lists
    WHERE id = (SELECT list_id
    FROM cards
    WHERE cards.id = 3)
```

*Solution 2 sans alias*
```
SELECT lists.name
    FROM cards
    JOIN lists ON lists.id = cards.list_id
    WHERE cards.id = 3
```

*Solution 3 avec les alias*
```
SELECT l.name FROM cards as c
    JOIN lists as l ON l.id = c.list_id
    WHERE c.id = 3
```

## Afficher toutes les cards de la list qui a l'id 3

*Solution nulle*
```
SELECT * FROM lists
    JOIN cards ON lists.id = list_id
    WHERE lists.id = 3
```

*Solution 2*
```
SELECT *
    FROM cards
    WHERE list_id=3
```

## Afficher tous les noms des cards du user qui a l'id 1

*Solution 1*
```
SELECT name
    FROM users_cards
    JOIN cards ON cards.id = card_id
    WHERE user_id = 1
```

*Solution 2*
```
SELECT name, firstname, lastname, user_id
    FROM users_cards
    JOIN cards ON cards.id = card_id
    JOIN users on users.id = user_id
    WHERE user_id=1
```

## Afficher tous les users associés à la card qui a l'id 2

*Solution 1*
```
SELECT card_id, firstname, lastname
    FROM users_cards
    JOIN users ON users.id = user_id
    WHERE card_id=2
```

*Solution 2*
```
SELECT card_id as ‘id de la card', firstname, lastname
    FROM users_cards
    JOIN users ON users.id = user_id
    WHERE card_id=2
```

## Afficher les lists avec leurs cards associées

*Solution 1 sans alias*
```
SELECT lists.name, cards.name
    FROM lists
    JOIN cards ON lists.id = list_id
```

*Solution 1 avec alias*
```
SELECT l.name, c.name
    FROM  lists as l
    JOIN cards as c ON c.list_id = l.id
```

*Solution 2 avec alias*
```
SELECT l.name, GROUP_CONCAT(c.name)
    as cards
    FROM  lists as l
    JOIN cards as c ON c.list_id = l.id
    GROUP BY l.id
```

*Solution 3*
```
SELECT l.name, CONCAT('["',
    GROUP_CONCAT(c.name SEPARATOR '","'),'"]')
    as cards
    FROM  lists as l
    JOIN cards as c ON c.list_id = l.id
    GROUP BY l.id
```

## Afficher les lists avec pour chacune les cards et pour chaque cards les users associés

*Petit bout de la solution*
```
SELECT uc.card_id as cid,
    CONCAT( '["', GROUP_CONCAT(CONCAT(u.lastname,' ', u.firstname)
    SEPARATOR '","'), '"]')
    as users
    FROM users_cards as uc
    JOIN users as u ON u.id = uc.user_id
    GROUP BY uc.card_id
```

*Solution*
```
SELECT l.name,
CONCAT('[',
    GROUP_CONCAT(
    CONCAT('{"name":"',c.name, '", users:',ucr.users,'}')
    ),']') as cards
    FROM (
    SELECT uc.card_id as cid,
    CONCAT('["', GROUP_CONCAT(CONCAT(u.lastname,' ', u.firstname)
    SEPARATOR '","'),'"]')
    as users
    FROM users_cards as uc
    JOIN users as u ON u.id = uc.user_id
    GROUP BY uc.card_id
    ) as ucr
    JOIN cards as c ON c.list_id = ucr.cid
    JOIN lists as l ON c.list_id = l.id
    GROUP BY l.id
```
