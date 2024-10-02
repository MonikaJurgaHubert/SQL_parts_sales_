SELECT public.sales.product_line, 
CASE 
    WHEN EXTRACT(MONTH FROM public.sales.date) = 6 THEN 'June'
    WHEN EXTRACT(MONTH FROM public.sales.date) = 7 THEN 'July'
    WHEN EXTRACT(MONTH FROM public.sales.date) = 8 THEN 'August'
    END AS month,
public.sales.warehouse, 
SUM(public.sales.total) - SUM(public.sales.payment_fee) AS net_revenue
FROM public.sales
WHERE public.sales.client_type = 'Wholesale'
GROUP BY public.sales.product_line, EXTRACT(MONTH FROM public.sales.date), public.sales.warehouse
ORDER BY public.sales.product_line, EXTRACT(MONTH FROM public.sales.date), net_revenue DESC;