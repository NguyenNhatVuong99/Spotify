/*
  Warnings:

  - You are about to drop the `LyricSegments` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `end` to the `Lyrics` table without a default value. This is not possible if the table is not empty.
  - Added the required column `index` to the `Lyrics` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start` to the `Lyrics` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "LyricSegments" DROP CONSTRAINT "LyricSegments_lyric_id_fkey";

-- DropIndex
DROP INDEX "Lyrics_track_id_key";

-- AlterTable
ALTER TABLE "Lyrics" ADD COLUMN     "end" TEXT NOT NULL,
ADD COLUMN     "index" INTEGER NOT NULL,
ADD COLUMN     "start" TEXT NOT NULL;

-- DropTable
DROP TABLE "LyricSegments";
