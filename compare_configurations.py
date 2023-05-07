from db_manager import *
from matplotlib import pyplot as plt
from matplotlib import colors as mcolors
from random import shuffle
import pandas as pd
import json

from matplotlib import style
style.use('fivethirtyeight')


def compare_training_process(config_id: list[int]):
    """Compare training process of given configurations."""
    db = Database()
    configs_results = []
    for config in config_id:
        config_results = db.training_process_table.get_rows(f'`configuration_id` = {config}')
        configs_results.append(config_results)
    colors = list(mcolors.BASE_COLORS.keys())

    all_loss = []
    all_accuracy = []
    all_val_loss = []
    all_val_accuracy = []
    for i in range(len(configs_results)):
        all_loss.append([x['loss'] for x in configs_results[i]])
        all_accuracy.append([x['accuracy'] for x in configs_results[i]])
        all_val_loss.append([x['val_loss'] for x in configs_results[i]])
        all_val_accuracy.append([x['val_accuracy'] for x in configs_results[i]])

    fig, axs = plt.subplots(2, 2, figsize=(10, 10))
    axs[0, 0].set_title('Loss')
    axs[0, 1].set_title('Accuracy')
    axs[1, 0].set_title('Validation loss')
    axs[1, 1].set_title('Validation accuracy')
    for i in range(len(configs_results)):
        axs[0, 0].plot(all_loss[i], color=colors[i], label=f'config {config_id[i]}')
        axs[0, 1].plot(all_accuracy[i], color=colors[i], label=f'config {config_id[i]}')
        axs[1, 0].plot(all_val_loss[i], color=colors[i], label=f'config {config_id[i]}')
        axs[1, 1].plot(all_val_accuracy[i], color=colors[i], label=f'config {config_id[i]}')
    axs[0, 0].legend()
    axs[0, 1].legend()
    axs[1, 0].legend()
    axs[1, 1].legend()

    for ax in axs.flat:
        for line in ax.get_lines():
            line.set_linewidth(1)
    plt.show()


def compare_results(config_id):
    db = Database()
    results = []
    for config in config_id:
        config_result = db.results_table.get_rows(f'`configuration_id` = {config}')
        config_result = [json.loads(x['result']) for x in config_result]
        results.append(config_result[0])

    worst_count = 3
    # pair data with index
    results = [[(i, x) for i, x in enumerate(result)] for result in results]
    # sort by second element of tuple
    sorted_results = [sorted(result, key=lambda x: x[1]) for result in results]
    # get worst results
    worst_results = [result[:worst_count] for result in sorted_results]

    all_indexes = []
    for result in worst_results:
        all_indexes += [x[0] for x in result]
    all_indexes = list(set(all_indexes))
    all_indexes.sort()

    worst_results = []

    for index in all_indexes:
        array = []
        for i in range(len(results)):
            array.append(results[i][index][1])
        worst_results.append(array)

    colors = list(mcolors.BASE_COLORS.keys())
    df = pd.DataFrame(worst_results, columns=config_id, index=all_indexes)
    df.plot.bar(figsize=(10, 10), color=colors)
    plt.xlabel('Class index')
    plt.ylabel('Accuracy')
    plt.title('Worst results')
    # rotate index labels
    plt.xticks(rotation=0)
    plt.show()


if __name__ == '__main__':
    configs = [15, 20]
    compare_training_process(configs)
    compare_results(configs)
