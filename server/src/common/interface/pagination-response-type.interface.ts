
export interface PaginationResponseType<T> {
    data: T[]
    total: number
    current_page: number
    items_per_page: number
}