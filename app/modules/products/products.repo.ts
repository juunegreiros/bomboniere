import prismaConfig from '@/prisma.config'

type Product = {
  id: string
  name: string
  price: number
  stock: number
  status: string
}

export async function listProducts() {
  const products = await prismaConfig.product.findMany()
  return products
}

export async function createProduct(product: Product) {
  const products = await prismaConfig.product.create({
    data: {
      id: product.id,
      name: product.name,
      price: product.price,
      stock: product.stock,
      status: product.status,
    },
  })
  return products
}

export async function getProductById(id: string) {
  const product = await prismaConfig.product.findUnique({
    where: { id },
  })

  return product
}

export async function updateProduct(id: string, product: Partial<Product>) {
  const updatedProduct = await prismaConfig.product.update({
    where: { id },
    data: product,
  })

  return updatedProduct
}

export async function deleteProduct(id: string) {
  const deletedProduct = await prismaConfig.product.delete({
    where: { id },
  })

  return deletedProduct
}
