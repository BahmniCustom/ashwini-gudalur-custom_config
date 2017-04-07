SELECT ROW_NUMBER() OVER (ORDER BY sm.name) as "Sl No",sm.name as Product,spl.name as Batch,sm.location_id,sm.location_dest_id,
sum(sm.product_qty) as Quantity,
cast(avg(spl.cost_price)as decimal(10,2)) as cp
  FROM stock_move sm
   INNER JOIN stock_location sl on sl.id = sm.location_dest_id
    INNER JOIN stock_production_lot spl on spl.id = sm.prodlot_id
         AND state = 'done'
           GROUP BY sm.name,sm.location_id,sm.location_dest_id,spl.name;
