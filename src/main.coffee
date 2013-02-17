# This contains the main code for the client, which sets up and connects all
# the necessary pieces.

state = new State()
machine = new Machine()
display = new Display(state, machine)
client = new Client(state, machine)
input = new Input(state, machine, client)

client.connect()

setInterval(
  ->
    machine.update()
    unless machine.server_tick - machine.tick > 5
      display.draw()
  50
)
