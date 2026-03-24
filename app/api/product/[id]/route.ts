import { deleteProduct, getProductById, updateProduct } from '@/app/modules/products/products.repo'
import { NextResponse } from 'next/server'

export async function GET(request: Request, { params }: { params: { id: string } }) {
  const { id } = await params
  const product = await getProductById(id)

  return NextResponse.json({ data: product }, { status: 200 })
}

export async function PATCH(request: Request, { params }: { params: { id: string } }) {
  const { id } = await params
  const body = await request.json()
  const updatedProduct = await updateProduct(id, body)

  return NextResponse.json({ data: updatedProduct }, { status: 200 })
}

export async function DELETE(request: Request, { params }: { params: { id: string } }) {
  const { id } = await params
  await deleteProduct(id)

  return new Response(null, { status: 204 })
}
