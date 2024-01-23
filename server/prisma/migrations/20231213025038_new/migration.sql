-- CreateEnum
CREATE TYPE "RepeatState" AS ENUM ('off', 'track', 'context');

-- AlterTable
ALTER TABLE "Lyrics" ADD COLUMN     "status" BOOLEAN NOT NULL DEFAULT true;

-- CreateTable
CREATE TABLE "Playlists" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "images" TEXT,
    "total_tracks" INTEGER NOT NULL DEFAULT 0,
    "public" BOOLEAN NOT NULL DEFAULT true,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Playlists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlaylistDetails" (
    "id" TEXT NOT NULL,
    "playlist_id" TEXT NOT NULL,
    "track_id" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlaylistDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FollowArtists" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "artist_id" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "tracksId" TEXT,

    CONSTRAINT "FollowArtists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Players" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "repeat_state" "RepeatState" NOT NULL DEFAULT 'off',
    "shuffle_state" BOOLEAN NOT NULL DEFAULT true,
    "progress_ms" INTEGER NOT NULL DEFAULT 0,
    "is_playing" BOOLEAN NOT NULL DEFAULT true,
    "track_id" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Players_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Playlists" ADD CONSTRAINT "Playlists_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlaylistDetails" ADD CONSTRAINT "PlaylistDetails_playlist_id_fkey" FOREIGN KEY ("playlist_id") REFERENCES "Playlists"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlaylistDetails" ADD CONSTRAINT "PlaylistDetails_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "Tracks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FollowArtists" ADD CONSTRAINT "FollowArtists_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FollowArtists" ADD CONSTRAINT "FollowArtists_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FollowArtists" ADD CONSTRAINT "FollowArtists_tracksId_fkey" FOREIGN KEY ("tracksId") REFERENCES "Tracks"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Players" ADD CONSTRAINT "Players_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Players" ADD CONSTRAINT "Players_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "Tracks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
