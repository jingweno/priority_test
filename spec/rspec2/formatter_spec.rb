require 'spec_helper'

describe PriorityTest::RSpec2::Formatter do
  it "adds to test result" do
    passed_examples = [
      double('passed example',
             :full_description => "desc1",
             :file_path => "file_path",
             :description => "passed example",
             :execution_result => { :status => 'passed', :started_at => Time.now, :run_time => 1}
            )
    ]

    failed_examples = [
      double('failed spec 1',
             :full_description => "desc2",
             :file_path => "file_path",
             :description => "first failed example",
             :execution_result => { :status => 'failed', :started_at => Time.now, :run_time => 1, :exception => Exception.new }
            ),
      double('failed spec 2',
             :full_description => "desc3",
             :file_path => "file_path",
             :description => "second failed example",
             :execution_result => { :status => 'failed', :started_at => Time.now, :run_time => 1, :exception => Exception.new }
            )
    ]

    test_result_collector = PriorityTest::Core::TestResultCollector.new(PriorityTest::Core::AllTests.new)
    formatter = PriorityTest::RSpec2::Formatter.new(test_result_collector)

    passed_examples.each {|e| formatter.example_passed(e) }
    failed_examples.each {|e| formatter.example_failed(e) }

    test_result_collector.all_tests.size.should == 3
  end

  # it "capures passed test result" do
  #   test_result_collector = PriorityTest::Core::TestResultCollector.new
  #   formatter = PriorityTest::RSpec2::Formatter.new(test_result_collector)
  #   RSpecFactory.passing_spec.run(RSpec::Core::Reporter.new(formatter))

  #   test_result_collector.passed_tests.size.should == 1

  #   passed_test = test_result_collector.passed_tests.first
  #   passed_test.identifier.should be
  #   passed_test.file_path.should be
  #   passed_test.status.should == 'passed'
  #   passed_test.run_time.should be
  #   passed_test.started_at.should be
  # end

  # it "capures failed test result" do
  #   test_result_collector = PriorityTest::Core::TestResultCollector.new
  #   formatter = PriorityTest::RSpec2::Formatter.new(test_result_collector)
  #   RSpecFactory.failing_spec.run(RSpec::Core::Reporter.new(formatter))

  #   test_result_collector.failed_tests.size.should == 1

  #   failed_test = test_result_collector.failed_tests.first
  #   failed_test.identifier.should be
  #   failed_test.file_path.should be
  #   failed_test.status.should == 'failed'
  #   failed_test.run_time.should be
  #   failed_test.started_at.should be
  # end
end
