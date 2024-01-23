// import { faker } from "@faker-js/faker/locale/vi";
// import { PrismaClient } from "@prisma/client";
// import { tracks } from "../data/tracks.data"
// export class TrackSeeder {
//     async run() {
//         const prisma = new PrismaClient();
//         const chunkSize = 500; // Adjust the chunk size based on your needs
//         const dataCreate = []
//         // tracks.forEach((item) => {
//         //     dataCreate.push({
//         //         name: item.name,
//         //         images: item.image,
//         //         popularity: Math.floor(Math.random() * 100),
//         //         album_id: item.album_id,
//         //         duration_ms: Math.floor(Math.random() * 20),
//         //         release_date: faker.date.anytime(),
//         //         mp3: item.mp3
//         //     })
//         // });


//         console.time("Seeding time");
//         try {
//             await prisma.tracks.deleteMany({})
//             // for (let i = 0; i < users.length; i += chunkSize) {
//             // const chunk = users.slice(i, i + chunkSize);
//             await prisma.tracks.createMany({
//                 data: dataCreate,
//             });
//             // }
//             console.log("tracks seeder done");
//         } catch (error) {
//             console.error("Error during seeding:", error);
//         } finally {
//             await prisma.$disconnect();
//             console.timeEnd("Seeding time");
//         }
//     }
// }

