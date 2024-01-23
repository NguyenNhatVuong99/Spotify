// import { faker } from "@faker-js/faker/locale/vi";
// import { PrismaClient } from "@prisma/client";
// import { hash } from "bcrypt";
// import { artists, favoriteArtists } from "./../data/artist.data";
// export class ArtistSeeder {
//     async run() {
//         const prisma = new PrismaClient();
//         const chunkSize = 500; // Adjust the chunk size based on your needs
//         const dataCreate = []
//         favoriteArtists.forEach((item, index) => {
//             dataCreate.push({
//                 name: item.name,
//                 images: item.image,
//                 followers: Math.floor(Math.random() * 10000),
//                 popularity: Math.floor(Math.random() * 100),
//                 user_id: item.user_id
//             })
//         });


//         console.time("Seeding time");
//         try {
//             // await prisma.artists.deleteMany({})
//             // for (let i = 0; i < users.length; i += chunkSize) {
//             // const chunk = users.slice(i, i + chunkSize);
//             await prisma.artists.createMany({
//                 data: dataCreate,
//             });
//             // }
//             console.log("users seeder done");
//         } catch (error) {
//             console.error("Error during seeding:", error);
//         } finally {
//             await prisma.$disconnect();
//             console.timeEnd("Seeding time");
//         }
//     }
// }

