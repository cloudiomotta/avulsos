import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("pop2000.csv", sep=";")

df['Homens']/=-df["Homens"].sum()
df["Mulheres"]/=df["Mulheres"].sum()

ax=df.plot.barh(x="Idade",y="Homens", xlabel="Proporção Populacional", ylabel="Idade")
df.plot.barh(x="Idade",y="Mulheres", color="Red",ax=ax)
plt.show()