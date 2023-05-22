import Debug "mo:base/Debug"

actor HelloWorld {

  stable var counter = 0;

  // Get the value of the counter.
  public query func get() : async Nat {
    return counter;
  };

  // Set the value of the counter.
  public func set(n : Nat) : async () {
    counter := n;
  };

  // Increment the value of the counter.
  public func inc() : async () {
    counter += 1;
  };

  public func debug_message() {
    Debug.print("Hello World! " # debug_show(counter))
  };

  public shared ({caller}) func whoami() : async Principal {
    return caller;
  };
}
