import numpy as np
import zmq

N = 2048
Fs = 22050  # sampling frequency
dt = 1 / Fs
f = 889
print(Fs, N, f)

t = np.arange(0, N*dt, dt)
sinus = np.sin(2 * np.pi * f * t)

FFT_data = np.fft.fft(sinus)
ps = np.abs(FFT_data)**2
F = np.arange(0, Fs, Fs/N)

print("N : ", N,
      " Fs : ", Fs,
      " Hz Resolution : ", F[1],
      " Max index : ", np.argmax(ps),
      " Max frequency : ", F[np.argmax(ps)],
      " Max value : ", np.max(ps))
#print(FFT_data)

r = np.array([r.real for r in FFT_data])
i = np.array([i.imag for i in FFT_data])


bind_to = "tcp://*:5555"
context = zmq.Context()
s = context.socket(zmq.PUB)
s.bind(bind_to)

syncservice = context.socket(zmq.REP)
syncservice.bind('tcp://*:5556')

# Get synchronization from subscribers
subscribers = 0
SUBSCRIBERS_EXPECTED = 1
while subscribers < SUBSCRIBERS_EXPECTED:
    print("Waiting for clients connections...")
    # wait for synchronization request
    msg = syncservice.recv()
    # send synchronization reply
    syncservice.send(b'')
    subscribers += 1
    print("+1 subscriber (%i/%i)" % (subscribers, SUBSCRIBERS_EXPECTED))

print("Ready to send FFT data !")
s.send(r.tobytes('C'))
s.send(i.tobytes('C'))
print("FFT data sent !")
