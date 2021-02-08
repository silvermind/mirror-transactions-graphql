## Description
This script uses the Mirror GraphQL API to pull all tax-relevant transactions and then exports them to the Koinly CSV format for import.

## Set up and running
For first time set up, please run `bundle`.

To run this script, call `ruby txs_fetcher.rb` and enter in your public wallet address. This script outputs a file called output.csv into the same working directory, which will contain all tax-relevant transactions in the Koinly format.

## Known Issues
- Does not currently handle fees in multiple currencies. In some Terra Swap transactions, fees can be denominated in both LUNA and UST, for instance. The script currently just uses the first of the fees rather than creating two rows.
