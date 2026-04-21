import { NextResponse } from 'next/server'
import { getUserById } from '@/app/modules/users/users.repo'

export async function GET(request: Request, { params }: { params: { id: string } }) {
  const { id } = await params
  const user = await getUserById(id)

  return NextResponse.json({ data: user }, { status: 200 })
}