require './data_process.rb'
require './graph_draw.rb'

data = DataProcess.new('data.txt')
graph = GraphDraw.new(data)

graph.draw
