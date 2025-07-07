# clean_order_reviews.py
import pandas as pd

# Load the original CSV
df = pd.read_csv('data/olist_order_reviews_dataset.csv')

# Drop duplicate review_id entries, keeping the first one
df.drop_duplicates(subset='review_id', inplace=True)

# Save the cleaned CSV
df.to_csv('data/olist_order_reviews_dataset_clean.csv', index=False)

print("Cleaned file saved as olist_order_reviews_dataset_clean.csv")
