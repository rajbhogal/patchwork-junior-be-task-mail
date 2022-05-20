# Patchwork Health Payroll Coding Task

- [Patchwork Health Payroll Coding Task](#patchwork-health-payroll-coding-task)
  - [Task](#task)
  - [Before you start](#before-you-start)
    - [Data](#data)
    - [Task 1 - Ingest the data](#task-1---ingest-the-data)
    - [Task 2 - Generate a report](#task-2---generate-a-report)
    - [Task 3 - Wrap it all up](#task-3---wrap-it-all-up)
  - [Submission Instructions](#submission-instructions)
  - [Evaluation](#evaluation)
  - [Installation](#installation)
  - [Development](#development)
    - [Additional Gem Dependencies](#additional-gem-dependencies)
    - [Testing](#testing)
    - [Using the Interactive Ruby prompt](#using-the-interactive-ruby-prompt)

Welome to the Patchwork Health coding task and thank you for taking time to complete it!

## Task

The task is centred around a payroll system, where we'd like you to write some code that will perform a few calculations.

The challenge has been broken up into three subtasks, which should help in its completion.

## Before you start

Please keep in mind that there is rarely just one "correct" way to achieve something with code. If what you have written works, and satisfies the requirements, then it's "correct". We're not looking for "perfect" code, we're looking for code that is readable and well-tested.

Remember that even most experienced programmers can't remember everything all of the time. If you need to use Google to help you figure out how to complete some of these tasks, that's absolutely fine. We won't consider it "cheating", but we definitely don't recommend that you use anything that you don't understand. It should help steer you, but it shouldn't do the work for you.

### Data

In the `data` folder you'll see two files: `timereport.csv` and `shiftdetails.csv`.

The shift details describes a "worked shift" and has the data:

```
shiftType,startTime,endTime
A,09:00,15:00
```

The time report captures the actual shifts worked and has data in the form of:

```
date,shiftType,rate,department,worker
04/01/2021,A,45,G&E,John
```

### Task 1 - Ingest the data

For the first task you'll need to load the data from the files as described above.

NOTE: you do **not** have to write any _validation_ logic in your code.

You can make use the class `Payroll::Ingest` provided in the folder `lib/payroll/ingest.rb` to write the data ingestion code.

We suggest you make use of these Ruby "standard library" (stdlib) modules:

- [CSV](https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html)
- Ruby Hash OR [OpenStruct](https://ruby-doc.org/stdlib-2.6.1/libdoc/ostruct/rdoc/OpenStruct.html)

_HINT_: load the files and merge the two sets of data into a single structure.

Remember to write some specs to test what you have written `spec/lib/payroll/ingest_spec.rb`

### Task 2 - Generate a report

The next task will be to generate a report that makes use of the data structure from subtask 1 and then calculates:

- the amount of TIME a staff member has worked
- the amount of TIME that was worked per department
- the amount we need to PAY each worker
- the amount we need to BILL each department

Add your code to `lib/payroll/report.rb`. You can use any data structure to capture these calculated values.

Remember to write some specs to test what you have written `spec/lib/payroll/report_spec.rb`.

### Task 3 - Wrap it all up

Finally, you can write a wrapper class the calls your code in `ingest` and `report` and prints a basic report to the console. To present your data, use an established format such as JSON or YAML.

This code should be added in `lib/payroll.rb`, and its specs in `spec/lib/payroll_spec.rb`

## Submission Instructions

1. Clone this repository: `git clone git@github.com:patchworkhealth/patchwork-junior-be-task.git`
1. Complete your project as described above within your local repository
1. Ensure everything you want to commit is committed
1. Run your specs one last time (just in case)
1. Create a git bundle: `git bundle create your_name.bundle --all`
1. Email the bundle file to Jordan Carter `jordan@patchwork.health`

## Evaluation

Evaluation of your submission will be based on the following criteria.

1. Did you follow the instructions for submission?
2. Did you complete the steps outlined in the _Task_ section?

After submitting your task you may find it useful to evaluate it yourself as well. Take a few notes and ask yourself a few questions about your submission. For example:

- What went well?
- What could have gone better?
- What would you have added if you had more time?

We won't ask to see these notes, but they might be useful to you when we meet to discuss your submission.

## Installation

Make sure you have Ruby installed that is 2.6.0 or higher. \
To install the require Gems, please run: `bin/setup`

## Development

### Additional Gem Dependencies

Feel free to add any extra Ruby Gems to Gemfile in order to accomplish these tasks.

### Testing

Run `bin/rspec` to run your tests. You can also give RSpec a specific file you'd like it to test, for example: `bin/rspec ./spec/lib/payroll_spec.rb`

We've also set up the [Guard Gem](https://github.com/guard/guard-rspec), which will automatically run specs as you save your files. Run `bin/guard` in your Terminal, and once it's started up it will watch for any changes in `./lib` or `./spec`, and will automatically run the correct tests for you. This will save you from having to manually run `bin/rspec` every time you change a file.

### Using the Interactive Ruby prompt

Run `bin/console` to start an IRB (Interactive Ruby) prompt, which will allow you to run your code directly. For example, if you had a Ruby class that looked like this:

```rb
class TestClass
  def say_hello(name)
    "Hello, #{name}"
  end
end
```

...you can test this code with IRB like this:

```irb
irb(main):001:1> TestClass.new.say_hello('Alice')
=> "Hello, Alice"
```
