module Query
  URL = "https://graph.mirror.finance/graphql"

  HTTP = GraphQL::Client::HTTP.new(URL) do
    def headers(context)
      # Optionally set any HTTP headers
      { "Content-Type": "application/json" }
    end
  end

  Schema = GraphQL::Client.load_schema(HTTP)
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

  TransactionsQuery = Client.parse <<-'GRAPHQL'
    query($wallet: String!, $limit: Float, $offset: Float, $tag: String) {
      txs(account: $wallet, limit: $limit, offset: $offset, tag: $tag){
        id
        height
        txHash
        address
        type
        data
        token
        datetime
        fee
        tags
        memo
        createdAt
      }
    }
  GRAPHQL

    AssetsQuery = Client.parse <<-'GRAPHQL'
    query {
      assets {
        symbol
        name
        token
        lpToken
        pair
      }
    }
  GRAPHQL

  AssetPricesQuery = Client.parse <<-'GRAPHQL'
    query($token: String!, $from: Float!, $to: Float!, $interval: Float!) {
      asset(token: $token) {
        prices {
          history(from: $from, to: $to, interval: $interval) {
            timestamp
            price
          }
          oracleHistory(from: $from, to: $to, interval: $interval) {
            timestamp
            price
          }
        }
      }
    }
  GRAPHQL

  YieldQuery = Client.parse <<-'GRAPHQL'
    query {
      assets {
        symbol
        token
        lpToken
        statistic {
          apr
        }
      }
    }
  GRAPHQL

  AssetsPricesQuery = Client.parse <<-'GRAPHQL'
    query($from: Float!, $to: Float!, $interval: Float!) {
      assets {
        symbol
        token
        prices {
          history(from: $from, to: $to, interval: $interval) {
            timestamp
            price
          }
          oracleHistory(from: $from, to: $to, interval: $interval) {
            timestamp
            price
          }
        }
      }
    }
  GRAPHQL
end