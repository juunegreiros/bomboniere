import 'dotenv/config'
import { PrismaClient } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'

const adapter = new PrismaPg({ connectionString: process.env.DATABASE_URL })
const prisma = new PrismaClient({ adapter })

const IDS ={
    Ingredient: {
        caramelo: '123',
        pipoca: '456',
    },

    Produto: {
        bis: '223',
    },
    Recipe: {
        pipocaComCaramelo: '323',
    }

}
async function createIngredient() { 
    await prisma.ingredient.create({
    data: {
      id: IDS.Ingredient.caramelo,
      name: 'caramelo',
      unidademedida: 'kg',
      stock: 100,
    },
  })

  await prisma.ingredient.create({
    data: {
        id: IDS.Ingredient.pipoca,
      name: 'pipoca',
      unidademedida: 'kg',
      stock: 100,
    },
  })
}


async function createProduto() { 
    await prisma.produto.create({
    data: {
      id: IDS.Produto.bis,
      name: 'bis',
      price: 3.20,
      stock: 100,
      status: 'disponivel',
    },
  })
}

async function createRecipe() { 
    await prisma.recipe.create({
    data: {
      id: IDS.Recipe.pipocaComCaramelo,
      name: 'pipoca com caramelo',
      description: 'pega a pipoca e mistura com o caramelo',
      price: 21.00,
      status: 'disponivel',
    },
  })
}

async function createRecipeIngredient() {
    await prisma.recipeIngredient.create({
    data: {
      idRecipe: IDS.Recipe.pipocaComCaramelo,
      idIngredient: IDS.Ingredient.caramelo,
      quantity: 5,
    },
  })
}

async function main() {
 await createIngredient()
 await createProduto()
 await createRecipe()
 await createRecipeIngredient()
}

main().finally(() => {
        prisma.$disconnect()
    })

