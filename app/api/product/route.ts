import { createProduct, listProducts } from '@/app/modules/products/products.repo'
import { NextResponse } from 'next/server'

export async function GET() {
  const products = await listProducts()
  return NextResponse.json({ data: products }, { status: 200 })
}

export async function POST(request: Request) {
  const body = await request.json()
  const { id, name, price, stock, status } = body
  const product = await createProduct({ id, name, price, stock, status })
  return NextResponse.json({ data: product }, { status: 201 })
}
