import { NextResponse } from 'next/server'
import { listUser } from '@/app/modules/users/users.repo'

export async function GET() {
  const users = await listUser()

  return NextResponse.json({ data: users }, { status: 200 })
}