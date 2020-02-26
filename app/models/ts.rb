require 'stellar-sdk'

class Ts
  def self.payment_sequence
    # ac1 = Stellar::Account.from_seed("SBXH4SEH32PENMMB66P4TY6LXUIFMRVFUMX2LJC3P2STHICBJLNQJOH5")
    ac1 = Stellar::Account.random
    ac2 = Stellar::Account.random

    client  = Stellar::Client.default_testnet()

    r1 = client.friendbot(ac1)
    r2 = client.friendbot(ac2)

    inf1 = client.account_info(ac1)
    p inf1['balances']
    inf2 = client.account_info(ac2)
    p inf2['balances']
    client.send_payment({from: ac1, to: ac2, amount: Stellar::Amount.new(5_000)})
    inf1 = client.account_info(ac1)
    p inf1['balances']
    inf2 = client.account_info(ac2)
    p inf2['balances']

    nil
  end

  def self.details(seed)
    client  = Stellar::Client.default_testnet()
    ac1 = Stellar::Account.from_seed(seed)
    inf1 = client.account_info(ac1)
    inf1['balances']
  end
end


