class AccountsController < ApplicationController

  def show
    seed = params[:id] == '1' ? 'SBXH4SEH32PENMMB66P4TY6LXUIFMRVFUMX2LJC3P2STHICBJLNQJOH5': 'foo'
    render json: {seed: seed, balance: Ts.details(seed)}
  end
end
