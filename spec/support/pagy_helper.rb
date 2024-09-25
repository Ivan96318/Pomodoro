module PagyHelper
  def mock_pagy
    mock_pagy = double("pagy",
      vars: {},
      pages: 1,
      page: 1,
      prev: nil,
      next: nil,
      series: [],
      items: 20,
      count: 0,
      from: 0,
      to: 0
    )
    assign(:pagy, mock_pagy)
  end
end
