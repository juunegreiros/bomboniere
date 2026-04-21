import { PrismaClient } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'

const adapter = new PrismaPg({ connectionString: process.env.DATABASE_URL })
const prisma = new PrismaClient({ adapter })

type User = {
  name: string
  email: string
  password: string
}

export async function listUser() {
  const users = await prisma.user.findMany()

  return users
}

export async function createUser(user: User) {
  const users = await prisma.user.create({
    data: {
      name: user.name,
      email: user.email,
      password: user.password,
    },
  })

  return users
}

export async function getUserById(id: string) {
  const user = await prisma.user.findUnique({
    where: { id: id },
  })

  return user
}