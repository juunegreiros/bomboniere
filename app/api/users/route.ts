import { NextResponse } from 'next/server'
import { createUser, listUser } from '@/app/modules/users/users.repo'

export async function GET() {
  const users = await listUser()

  return NextResponse.json({ data: users }, { status: 200 })
}

export async function POST(request: Request) {
  const body = await request.json()
  const { name, email, password } = body
  const user = await createUser({ name, email, password })

  return NextResponse.json({ data: user }, { status: 201 })
}