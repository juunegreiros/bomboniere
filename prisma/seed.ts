import 'dotenv/config'
import { PrismaClient } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'

const adapter = new PrismaPg({ connectionString: process.env.DATABASE_URL })
const prisma = new PrismaClient({ adapter })

console.log("🌱 SEED RODANDO...");

async function createPermission() {
  await prisma.permission.create({
    data: {
      key: '1',
      description: 'view.product',
    },
  })
}

async function createrole() {
  await prisma.role.create({
    data: {
      name: 'Atendente',
      description: 'Atendente da bomboniere',
    },
  })
}

async function createUser(){
  await prisma.user.create({
    data: {
      name: 'Gabriela',
      email: 'gabriela@email.com',
      password: '123456',
    },
  })
}

async function main() {
  await createPermission()
  await createrole()
  await createUser()
}

main().finally(() => {
  prisma.$disconnect()
})