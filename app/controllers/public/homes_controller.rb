class Public::HomesController < Public::ApplicationController
  allow_unauthenticated_access only: [:top]
  
  def top
  end
end
