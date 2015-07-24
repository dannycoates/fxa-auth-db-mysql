-- -- drop new stored procedures
-- DROP PROCEDURE `createSessionToken_2`;
-- DROP PROCEDURE `sessionToken_2`;
-- DROP PROCEDURE `updateSessionToken_1`;

-- -- drop new columns
-- ALTER TABLE sessionTokens DROP COLUMN userAgent;
-- ALTER TABLE sessionTokens DROP COLUMN lastAccessTime;

-- -- Schema patch-level decrement.
-- UPDATE dbMetadata SET value = '14' WHERE name = 'schema-patch-level';
