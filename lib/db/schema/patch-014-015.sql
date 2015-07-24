-- Add userAgent and lastAccessTime fields to sessionTokens table

ALTER TABLE sessionTokens ADD COLUMN userAgent VARCHAR(255) NOT NULL DEFAULT '';
ALTER TABLE sessionTokens ADD COLUMN lastAccessTime BIGINT UNSIGNED NOT NULL DEFAULT 0;

CREATE PROCEDURE `createSessionToken_2` (
    IN tokenId BINARY(32),
    IN tokenData BINARY(32),
    IN uid BINARY(16),
    IN createdAt BIGINT UNSIGNED,
    IN userAgent VARCHAR(255)
)
BEGIN
    INSERT INTO sessionTokens(
        tokenId,
        tokenData,
        uid,
        createdAt,
        userAgent,
        lastAccessTime
    )
    VALUES(
        tokenId,
        tokenData,
        uid,
        createdAt,
        userAgent,
        createdAt
    );
END;

CREATE PROCEDURE `sessionToken_2` (
    IN `inTokenId` BINARY(32)
)
BEGIN
    SELECT
        t.tokenData,
        t.uid,
        t.createdAt,
        t.userAgent,
        t.lastAccessTime,
        a.emailVerified,
        a.email,
        a.emailCode,
        a.verifierSetAt,
        a.locale
    FROM
        sessionTokens t,
        accounts a
    WHERE
        t.tokenId = inTokenId
    AND
        t.uid = a.uid
    ;
END;

CREATE PROCEDURE `updateSessionToken_1` (
    IN userAgentArg VARCHAR(255),
    IN lastAccessTimeArg BIGINT UNSIGNED,
    IN tokenIdArg BINARY(32)
)
BEGIN
    UPDATE sessionTokens
        SET userAgent = userAgentArg,
            lastAccessTime = lastAccessTimeArg
        WHERE tokenId = tokenIdArg;
END;

UPDATE dbMetadata SET value = '15' WHERE name = 'schema-patch-level';

