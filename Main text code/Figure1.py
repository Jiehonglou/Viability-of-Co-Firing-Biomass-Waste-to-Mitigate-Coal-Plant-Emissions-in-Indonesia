################################################################################################
## Title: The viability of co-firing biomass waste to mitigate coal plant emissions in Indonesia
## Python script for creating Figure 1  
## AUTHOR:            Rishabh Sinha 
## Date: 2024 Jan
################################################################################################


import pandas as pd
import plotly.graph_objects as go

df_sankey = pd.read_excel(r"C:\Users\mschre65\Documents\Misc_python\Sankey\cofiringsankey2024.xlsx")

sankey_data = []
for index, row in df_sankey.iterrows():
    for col in df_sankey.columns:
        if col not in ['Feedstock', 'Total avail (MJ)']:
            sankey_data.append({'source': row['Feedstock'], 'target': col, 'value': row[col]})
        elif col == 'Total avail (MJ)':
            sankey_data.append({'source': row['Feedstock'], 'target': 'Total remaining', 'value': row[col]})

df_sankey_formatted = pd.DataFrame(sankey_data)
df_sankey_formatted = df_sankey_formatted[df_sankey_formatted['value'] > 0]

unique_nodes = pd.concat([df_sankey_formatted['source'], df_sankey_formatted['target']]).unique()
label_list = unique_nodes.tolist()

biomass_color_map = {
    'Bagasse': 'rgba(136, 204, 238, 0.8)',
    'PKS': 'rgba(102, 17, 0, 0.8)',
    'EFB': 'rgba(136, 34, 85, 0.8)',
    'Rubber': 'rgba(170, 68, 153, 0.8)',
    'Rice straw': 'rgba(153, 153, 51, 0.8)',
    'Rice husk': 'rgba(221, 204, 119, 0.8)', 
    'MSW': 'rgba(136, 136, 136, 0.8)',
    'Wood waste': 'rgba(17, 119, 51, 0.8)'
}

color_list = [biomass_color_map[feedstock] for feedstock in df_sankey['Feedstock']]
link_color_list = ['rgba(184,199,148, 0.8)' if target == 'Total remaining' else 'rgba(128,128,128,0.5)' for source, target in zip(df_sankey_formatted['source'], df_sankey_formatted['target'])]

source_indices = [label_list.index(src) for src in df_sankey_formatted['source']]
target_indices = [label_list.index(tgt) for tgt in df_sankey_formatted['target']]

node_x_positions = [10 if i < len(df_sankey['Feedstock']) else 10 for i in range(len(label_list))]

fig = go.Figure(data=[go.Sankey(
    node=dict(
        pad=15,
        thickness=20,
        line=dict(color='black', width=0.5),
        label=label_list,
        color=color_list,
        x=node_x_positions
    ),
    link=dict(
        source=source_indices,
        target=target_indices,
        value=df_sankey_formatted['value'].tolist(),
        color=link_color_list
    )
)])

fig.update_layout(
    #title_text="Cofiring Feedstocks to Total Remaining",
    font=dict(size=14, color='black', family='Arial Black'),
    #Adjust plot margins to prevent cutting off labels
    margin=dict(l=100, r=100, t=100, b=100)
)

fig.show()
