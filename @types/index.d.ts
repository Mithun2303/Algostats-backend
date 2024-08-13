import { UserResponseDto } from "src/auth/dto/auth.dto";

declare global {
    namespace Express{
        export interface Request{
            user?:UserResponseDto
        }
    }
}