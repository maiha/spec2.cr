require "./spec_helper"

Spec2.random_order

class Greeting
  getter exclamation

  def initialize(@exclamation)
  end

  def for(name)
    "#{exclamation}, #{name}"
  end
end

module Specs
  include Spec2::Macros

  describe Greeting do
    let(greeting :: Greeting) { Greeting.new("hello") }
    let!(stuff :: String) { p "==== some stuff in let! ====" }

    before do
      p greeting.for("earth")
    end

    after do
      p greeting.for("after-earth")
    end

    subject(Greeting) { Greeting.new("hi") }
    subject(another_greeting :: Greeting) { Greeting.new("aloha") }
    subject!(another_stuff :: String) { p "==== some other stuff in subject! ====" }

    it "works" do
      expect(greeting.for("world"))
        .to eq("hello, world")

      expect(subject.for("world"))
        .to eq("hi, world")

      expect(another_greeting.for("world"))
        .to eq("aloha, world")
    end

    it { is_expected.to eq(Greeting.new("hi")) }

    it "doesnt" do
      expect(2+2).not_to eq(4)
    end

    it "fails" do
      raise "Hello Error"
    end
  end
end
