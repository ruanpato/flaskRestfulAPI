/* Consultas */
-- Mostra todos usuários e setores onde estes estão
SELECT "Person"."id" AS "User ID", "Person"."name" AS "Full Name", 
	"Person"."title" AS "Title", "Person"."email" AS "E-Mail", 
	"Person"."birthday" AS "Birthday", "Role"."id" as "Role ID", "Role"."description" as "Description" 
	FROM "Person" INNER JOIN "Person_Role" ON "Person"."id" = "Person_Role"."id_Person"
	INNER JOIN "Role" ON "Person_Role"."id_Role" = "Role"."id";
-- Mostra todas Pessoas de determinado setor pelo nome do setor
SELECT "Person"."id" AS "User ID", "Person"."name" AS "Full Name", 
	"Person"."title" AS "Title", "Person"."email" AS "E-Mail", 
	"Person"."birthday" AS "Birthday", "Role"."id" as "Role ID", "Role"."description" as "Description" 
	FROM "Person" INNER JOIN "Person_Role" ON "Person"."id" = "Person_Role"."id_Person"
	INNER JOIN "Role" ON "Person_Role"."id_Role" = "Role"."id"
	WHERE "Role"."description" = 'PROGESP';
-- Mostra todos setores que determinado usuário está
SELECT "Person"."id" AS "User ID", "Person"."name" AS "Full Name", 
	"Person"."title" AS "Title", "Person"."email" AS "E-Mail", 
	"Person"."birthday" AS "Birthday", "Role"."id" as "Role ID", "Role"."description" as "Description" 
	FROM "Person" INNER JOIN "Person_Role" ON "Person"."id" = "Person_Role"."id_Person"
	INNER JOIN "Role" ON "Person_Role"."id_Role" = "Role"."id"
	WHERE "Person"."name" = 'Vitória Martins Costa';