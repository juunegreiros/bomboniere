import { NextResponse } from 'next/server'
import { getUserById, updateUser } from '@/app/modules/users/users.repo'

export async function GET(request: Request, { params }: { params: { id: string } }) {
  const { id } = await params
  const user = await getUserById(id)

  return NextResponse.json({ data: user }, { status: 200 })
}

export async function PATCH(request: Request, { params }: { params: { id: string } }) {
  const { id } = await params
  const body = await request.json()
  const updatedUser = await updateUser(id, body)

  return NextResponse.json({ data: updatedUser }, { status: 200 })
}