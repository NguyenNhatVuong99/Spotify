// import { faker } from "@faker-js/faker/locale/vi";
// import { PrismaClient } from "@prisma/client";
// import { hash } from "bcrypt";
// export class UserSeeder {
//     async run() {
//         const prisma = new PrismaClient();
//         const chunkSize = 50; // Adjust the chunk size based on your needs
//         const dataUsers = [{
//             full_name: 'Nguyễn Nhất Vương',
//             email: 'nhatvuong99@gmail.com',
//             password: await hash('nhatvuong99', 10),
//             images: 'public\images\nhatvuong.jpg'

//         }, {
//             full_name: 'Lê Tuyết Ni',
//             email: 'tuyetni99@gmail.com',
//             password: await hash('nhatvuong99', 10),
//             images: 'public\images\ni.jpg'
//         }];
//         for (let index = 0; index < 50; index++) {
//             const hashPassword = await hash('password', 10)
//             dataUsers.push({
//                 full_name: faker.person.fullName(),
//                 email: faker.internet.email(),
//                 password: hashPassword,
//                 images: faker.image.avatar()
//             })
//         }
//         console.time("Seeding time");
//         try {
//             await prisma.users.deleteMany({})
//             // for (let i = 0; i < users.length; i += chunkSize) {
//             // const chunk = users.slice(i, i + chunkSize);
//             await prisma.users.createMany({
//                 data: dataUsers,
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

