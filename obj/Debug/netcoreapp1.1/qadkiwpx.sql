IF OBJECT_ID(N'__EFMigrationsHistory') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Artists] (
    [ArtistID] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Artists] PRIMARY KEY ([ArtistID])
);

GO

CREATE TABLE [Genres] (
    [GenreID] int NOT NULL IDENTITY,
    [Name] nvarchar(20) NOT NULL,
    CONSTRAINT [PK_Genres] PRIMARY KEY ([GenreID])
);

GO

CREATE TABLE [Albums] (
    [AlbumID] int NOT NULL IDENTITY,
    [ArtistID] int NOT NULL,
    [GenreID] int NOT NULL,
    [Title] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Albums] PRIMARY KEY ([AlbumID]),
    CONSTRAINT [FK_Albums_Artists_ArtistID] FOREIGN KEY ([ArtistID]) REFERENCES [Artists] ([ArtistID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Albums_Genres_GenreID] FOREIGN KEY ([GenreID]) REFERENCES [Genres] ([GenreID]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Albums_ArtistID] ON [Albums] ([ArtistID]);

GO

CREATE INDEX [IX_Albums_GenreID] ON [Albums] ([GenreID]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170302032652_init', N'1.1.1');

GO

