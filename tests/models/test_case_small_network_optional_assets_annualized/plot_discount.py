import matplotlib.pyplot as plt

import numpy as np


def calculate_annuity_factor(discount_rate: np.ndarray, years_asset_life: float) -> np.ndarray:
    """
    Calculate the annuity factor, given an annual discount_rate over
    a specified number years_asset_life.

    Parameters:
        discount_rate (np.ndarray): Annual discount rate (expressed as
        a decimal, e.g., 0.05 for 5%).
        years_asset_life (float): Number of Years.

    Returns:
        np.ndarray: annuity_factor.
    """
    if np.any(discount_rate < 0) or np.any(discount_rate > 1):
        raise ValueError("Discount rate must be between 0-1")

    if years_asset_life <= 0:
        raise ValueError("Asset technical life must be greather than 0")

    annuity_factor = np.where(
        discount_rate == 0,
        1 / years_asset_life,
        discount_rate / (1 - (1 + discount_rate) ** (-years_asset_life)),
    )

    return annuity_factor


# Generate a range of discount factor values
discount_rate = np.linspace(0.0001, 0.99999, 100)

# Generate the plot
plt.figure(figsize=(10, 6))

# Loop over different years in a range
for years_asset_life in [1] + list(range(5, 31, 5)):
    # Calculate the corresponding annuity factors
    annuity_factors = calculate_annuity_factor(discount_rate, years_asset_life)
    # Plot the line for each year
    plt.plot(discount_rate, 1 / annuity_factors, label=f"Life = {years_asset_life} years")

plt.xlabel("Discount rate)")
plt.ylabel("1/(Annuity factor)")
plt.title("Discount rate vs Annuity Factor")
plt.legend()
plt.grid(True)
plt.show()
