-- CreateEnum
CREATE TYPE "Role" AS ENUM ('user', 'admin');

-- CreateEnum
CREATE TYPE "UserProduct" AS ENUM ('free', 'premium');

-- CreateEnum
CREATE TYPE "AlbumType" AS ENUM ('album', 'single', 'compilation');

-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "images" TEXT,
    "followers" INTEGER NOT NULL DEFAULT 0,
    "product" "UserProduct" NOT NULL DEFAULT 'free',
    "role" "Role" NOT NULL DEFAULT 'user',
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Artists" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "images" TEXT,
    "followers" INTEGER NOT NULL DEFAULT 0,
    "popularity" INTEGER NOT NULL DEFAULT 0,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Artists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Albums" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "images" TEXT,
    "followers" INTEGER NOT NULL DEFAULT 0,
    "popularity" INTEGER NOT NULL DEFAULT 0,
    "type" "AlbumType" NOT NULL DEFAULT 'album',
    "total_tracks" INTEGER NOT NULL,
    "release_date" TIMESTAMP(3) NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "artist_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Albums_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tracks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "images" TEXT,
    "duration_ms" INTEGER NOT NULL,
    "popularity" INTEGER NOT NULL DEFAULT 0,
    "release_date" TIMESTAMP(3) NOT NULL,
    "mp3" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "album_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tracks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lyrics" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "track_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Lyrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LyricSegments" (
    "id" TEXT NOT NULL,
    "lyric_id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "start" TEXT NOT NULL,
    "end" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LyricSegments_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Artists_user_id_key" ON "Artists"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Albums_artist_id_key" ON "Albums"("artist_id");

-- CreateIndex
CREATE UNIQUE INDEX "Tracks_album_id_key" ON "Tracks"("album_id");

-- CreateIndex
CREATE UNIQUE INDEX "Lyrics_track_id_key" ON "Lyrics"("track_id");

-- CreateIndex
CREATE UNIQUE INDEX "LyricSegments_lyric_id_key" ON "LyricSegments"("lyric_id");

-- AddForeignKey
ALTER TABLE "Artists" ADD CONSTRAINT "Artists_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Albums" ADD CONSTRAINT "Albums_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tracks" ADD CONSTRAINT "Tracks_album_id_fkey" FOREIGN KEY ("album_id") REFERENCES "Albums"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lyrics" ADD CONSTRAINT "Lyrics_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "Tracks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LyricSegments" ADD CONSTRAINT "LyricSegments_lyric_id_fkey" FOREIGN KEY ("lyric_id") REFERENCES "Lyrics"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
