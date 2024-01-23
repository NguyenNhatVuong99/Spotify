// import { faker } from "@faker-js/faker/locale/vi";
// import { PrismaClient } from "@prisma/client";
// import { hash } from "bcrypt";
// import { albums } from "./../data/albums.data"
// export class AlbumSeeder {
//     async run() {
//         const prisma = new PrismaClient();
//         const chunkSize = 500; // Adjust the chunk size based on your needs
//         const dataCreate = []
//         albums.forEach((item) => {
//             dataCreate.push({
//                 name: item.name,
//                 images: item.image,
//                 followers: Math.floor(Math.random() * 10000),
//                 popularity: Math.floor(Math.random() * 100),
//                 artist_id: item.artist_id,
//                 total_tracks: Math.floor(Math.random() * 20),
//                 release_date: faker.date.anytime()
//             })
//         });


//         console.time("Seeding time");
//         try {
//             // await prisma.albums.deleteMany({})
//             // for (let i = 0; i < users.length; i += chunkSize) {
//             // const chunk = users.slice(i, i + chunkSize);
//             await prisma.albums.createMany({
//                 data: dataCreate,
//             });
//             // }
//             console.log("albums seeder done");
//         } catch (error) {
//             console.error("Error during seeding:", error);
//         } finally {
//             await prisma.$disconnect();
//             console.timeEnd("Seeding time");
//         }
//     }
// }

