// import { faker } from "@faker-js/faker/locale/vi";
// import { PrismaClient } from "@prisma/client";
// import { hash } from "bcrypt";
// import { lyrics } from "./../data/lyrics.data"
// export class LyricSeeder {
//     async run() {
//         const prisma = new PrismaClient();
//         const chunkSize = 500; // Adjust the chunk size based on your needs
//         const dataCreate = []
//         // lyrics.forEach((item, index) => {
//         //     dataCreate.push({
//         //         content: item.content,
//         //         track_id: '3eda2b8f-25c1-42ec-b67a-9b4c7ff7d41e',
//         //         index: index,
//         //         start: item.start,
//         //         end: item.end,
//         //     })
//         // });


//         console.time("Seeding time");
//         try {
//             await prisma.lyrics.deleteMany({})
//             // for (let i = 0; i < users.length; i += chunkSize) {
//             // const chunk = users.slice(i, i + chunkSize);
//             await prisma.lyrics.createMany({
//                 data: dataCreate,
//             });
//             // }
//             console.log("lyrics seeder done");
//         } catch (error) {
//             console.error("Error during seeding:", error);
//         } finally {
//             await prisma.$disconnect();
//             console.timeEnd("Seeding time");
//         }
//     }
// }

