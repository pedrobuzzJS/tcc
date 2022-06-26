import { useEffect, useState } from "react"
import axios, { AxiosRequestConfig, AxiosRequestHeaders } from "axios";

const api = axios.create({
    baseURL: 'www.google.com'
});

export function useFetch<T = unknown>(url: string, options?: AxiosRequestConfig) {
    const [data, setData] = useState<T | null>(null);
    const [isFetching, setIsFetching] = useState(true);
    const [error, setError] = useState<Error | null>(null);

    useEffect( () => {
        api.get(url)
        .then(response => {
            setData(response.data);
        })
        .catch( err => {
            setError(err);
        } )
        .finally( () => {
            setIsFetching(false);
        } )
    }, [])

    return { data, error, isFetching }
}