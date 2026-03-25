import { NextResponse } from 'next/server'

export async function GET() {
  const ingredients = await listIngredients()
  return NextResponse.json({ data: ingredients }, { status: 200 })
}

export async function POST(request: Request) {
  const body = await request.json()
  const { id, name, unit, stock, recipes } = body
  const ingredient = await createIngredient({ id, name, unit, stock, recipes })
  return NextResponse.json({ data: ingredient }, { status: 201 })
}
