How to handle Control-C in Java
-------------------------------

How to gracefully shutdown multi-threaded application on terminate signal

        // Create barrier and set counddown counter to 1
        CountDownLatch doneSignal = new CountDownLatch(1);

        Runtime.getRuntime().addShutdownHook(new Thread() {

            /** This handler will be called on Control-C pressed */
            @Override
            public void run() {
                // Decrement counter.
                // It will became 0 and main thread who waits for this barrier could continue run (and fulfill all proper shutdown steps)
                doneSignal.countDown();
            }
        });


        // Here we enter wait state until control-c will be pressed
        try {
            doneSignal.await();
        } catch (InterruptedException e) {
        }

        // Once ctrl-c pressed, barrier is open and we processed to
        // shutdown steps here

        . . . any shutdown steps to be perfromed here . . .



