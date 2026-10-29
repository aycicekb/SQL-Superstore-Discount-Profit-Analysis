# Superstore Sales & Profitability Analysis
Does profitability generally decrease as discount rates increase?

## 1. Project Overview
The objective of this analysis is to investigate the relationship between discount rates and profitability using sales transaction data.

The analysis was conducted using SQL in PostgreSQL.

The following metrics were examined:
- **Discount Frequency:** The number of transactions of each discount group

``` sql
SELECT
   discount*100 as discount,
    COUNT(discount) as discount_frqncy
FROM superstore
GROUP BY discount 
ORDER BY discount_frqncy desc
```

- **Average profit margin:** The average of individual transaction profit margins.
- **Total profit:** The sum of profits generated at each discount level.
- **Overall profit margin:** Total profit divided by total sales, multiplied by 100.
## 2. Key Findings
### Discount Distribution

The most frequent discount levels were 0% and 20%, with 4,798 and 3,657 transactions, respectively. The average discount rate was approximately 15%, while the maximum was 80%.

|  discount  | discount_frequency|
|------------|-------------------|
| 0%         | 4798              |
| 20%        | 3657              |
| 70%        | 418               |
| 80%        | 300               |
| 30%        | 227               |
| 40%        | 206               |
| 60%        | 138               |
| 10%        | 94                | 
| 50%        | 66                |
| 15%        | 52                |
| 32%        | 27                |
| 45%        | 11                | 



### Relationship Between Discounts and Profitability

Transactions with no discount generated the highest total profit, approximately 320,987.60, and the highest overall profit margin, 29.51%.

| Discount Rate | Frequency |
|--------------:|---------:|
| 0%            | 4,798    |
| 20%           | 3,657    |
| 70%           | 418      |
| 80%           | 300      |
| 30%           | 227      |
| 40%           | 206      |
| 60%           | 138      |
| 10%           | 94       |
| 50%           | 66       |
| 15%           | 52       |
| 32%           | 27       |
| 45%           | 11       |

The overall profit margin generally decreased as discount rates increased. Discount groups of 30% or higher generated negative total profits in this dataset.

However, the relationship was not perfectly linear. For example, the 10% discount group had a higher overall profit margin than the 15% and 20% groups.

### Average vs. Overall Profit Margin

The average transaction-level profit margin and the overall profit margin produced different results. This is because the average transaction-level margin gives each transaction equal weight, while the overall margin reflects total profit relative to total sales.

## 3. Conclusion
The analysis suggests a negative relationship between discount rates and profitability in this dataset. Transactions without discounts were the most profitable overall, while higher discount levels were generally associated with lower profit margins and, at discount levels of 30% or higher, negative total profits.

These findings show an association rather than proof of causation. Other factors, such as product category, sales volume, and product costs, may also influence profitability.

## 4. Limitations

- Some discount groups contain relatively few transactions, so their results should be interpreted cautiously.

- The analysis does not control for product categories, product costs, or other potential influencing factors.

- The findings describe this dataset and may not apply to every business or sales context.