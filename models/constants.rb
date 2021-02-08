module Constants
  MILLION = 10 ** 6
  ASSETS = [
        {"symbol"=>"UST",
          "token"=>"uusd"
        },
        {"symbol"=>"LUNA",
          "token"=>"uluna"
        },
        {"symbol"=>"KRT",
          "token"=>"ukrw"
        },
        {"symbol"=>"MNT",
          "token"=>"umnt"
        },
        {"symbol"=>"SDT",
          "token"=>"usdr"
        },
        {"symbol"=>"MIR",
        "name"=>"Mirror",
        "token"=>"terra15gwkyepfc6xgca5t5zefzwy42uts8l2m4g40k6",
        "lpToken"=>"terra17gjf2zehfvnyjtdgua9p9ygquk6gukxe7ucgwh",
        "pair"=>"terra1amv303y8kzxuegvurh0gug2xe9wkgj65enq2ux"},
       {"symbol"=>"mIAU",
        "name"=>"iShares Gold Trust",
        "token"=>"terra15hp9pr8y4qsvqvxf3m4xeptlk7l8h60634gqec",
        "lpToken"=>"terra1jl4vkz3fllvj6fchnj2trrm9argtqxq6335ews",
        "pair"=>"terra1q2cg4sauyedt8syvarc8hcajw6u94ah40yp342"},
       {"symbol"=>"mNFLX",
        "name"=>"Netflix",
        "token"=>"terra1jsxngqasf2zynj5kyh0tgq9mj3zksa5gk35j4k",
        "lpToken"=>"terra1mwu3cqzvhygqg7vrsa6kfstgg9d6yzkgs6yy3t",
        "pair"=>"terra1yppvuda72pvmxd727knemvzsuergtslj486rdq"},
       {"symbol"=>"mGOOGL",
        "name"=>"Google",
        "token"=>"terra1h8arz2k547uvmpxctuwush3jzc8fun4s96qgwt",
        "lpToken"=>"terra1falkl6jy4087h4z567y2l59defm9acmwcs70ts",
        "pair"=>"terra1u56eamzkwzpm696hae4kl92jm6xxztar9uhkea"},
       {"symbol"=>"mTSLA",
        "name"=>"Tesla",
        "token"=>"terra14y5affaarufk3uscy2vr6pe6w6zqf2wpjzn5sh",
        "lpToken"=>"terra1ygazp9w7tx64rkx5wmevszu38y5cpg6h3fk86e",
        "pair"=>"terra1pdxyk2gkykaraynmrgjfq2uu7r9pf5v8x7k4xk"},
       {"symbol"=>"mVIXY",
        "name"=>"ProShares VIX",
        "token"=>"terra1zp3a6q6q4953cz376906g5qfmxnlg77hx3te45",
        "lpToken"=>"terra1cmrl4txa7cwd7cygpp4yzu7xu8g7c772els2y8",
        "pair"=>"terra1yngadscckdtd68nzw5r5va36jccjmmasm7klpp"},
       {"symbol"=>"mTWTR",
        "name"=>"Twitter",
        "token"=>"terra1cc3enj9qgchlrj34cnzhwuclc4vl2z3jl7tkqg",
        "lpToken"=>"terra1fc5a5gsxatjey9syq93c2n3xq90n06t60nkj6l",
        "pair"=>"terra1ea9js3y4l7vy0h46k4e5r5ykkk08zc3fx7v4t8"},
       {"symbol"=>"mBABA",
        "name"=>"Alibaba Group Holdings Ltd ADR",
        "token"=>"terra1w7zgkcyt7y4zpct9dw8mw362ywvdlydnum2awa",
        "lpToken"=>"terra1stfeev27wdf7er2uja34gsmrv58yv397dlxmyn",
        "pair"=>"terra1afdz4l9vsqddwmjqxmel99atu4rwscpfjm4yfp"},
       {"symbol"=>"mUSO",
        "name"=>"United States Oil Fund, LP",
        "token"=>"terra1lvmx8fsagy70tv0fhmfzdw9h6s3sy4prz38ugf",
        "lpToken"=>"terra1utf3tm35qk6fkft7ltcnscwml737vfz7xghwn5",
        "pair"=>"terra1zey9knmvs2frfrjnf4cfv4prc4ts3mrsefstrj"},
       {"symbol"=>"mSLV",
        "name"=>"iShares Silver Trust",
        "token"=>"terra1kscs6uhrqwy6rx5kuw5lwpuqvm3t6j2d6uf2lp",
        "lpToken"=>"terra178cf7xf4r9d3z03tj3pftewmhx0x2p77s0k6yh",
        "pair"=>"terra1f6d9mhrsl5t6yxqnr4rgfusjlt3gfwxdveeyuy"},
       {"symbol"=>"mQQQ",
        "name"=>"Invesco QQQ Trust",
        "token"=>"terra1csk6tc7pdmpr782w527hwhez6gfv632tyf72cp",
        "lpToken"=>"terra16j09nh806vaql0wujw8ktmvdj7ph8h09ltjs2r",
        "pair"=>"terra1dkc8075nv34k2fu6xn6wcgrqlewup2qtkr4ymu"},
       {"symbol"=>"mAAPL",
        "name"=>"Apple",
        "token"=>"terra1vxtwu4ehgzz77mnfwrntyrmgl64qjs75mpwqaz",
        "lpToken"=>"terra122asauhmv083p02rhgyp7jn7kmjjm4ksexjnks",
        "pair"=>"terra1774f8rwx76k7ruy0gqnzq25wh7lmd72eg6eqp5"},
       {"symbol"=>"mAMZN",
        "name"=>"Amazon.com",
        "token"=>"terra165nd2qmrtszehcfrntlplzern7zl4ahtlhd5t2",
        "lpToken"=>"terra1q7m2qsj3nzlz5ng25z5q5w5qcqldclfe3ljup9",
        "pair"=>"terra1vkvmvnmex90wanque26mjvay2mdtf0rz57fm6d"},
       {"symbol"=>"mMSFT",
        "name"=>"Microsoft Corporation",
        "token"=>"terra1227ppwxxj3jxz8cfgq00jgnxqcny7ryenvkwj6",
        "lpToken"=>"terra14uaqudeylx6tegamqmygh85lfq8qg2jmg7uucc",
        "pair"=>"terra10ypv4vq67ns54t5ur3krkx37th7j58paev0qhd"}
  ]

  def get_symbol_from_token(token)
    asset = ASSETS.find { |asset| asset["token"] == token }
    asset["symbol"]
  end
end