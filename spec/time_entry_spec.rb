describe "TimeEntry" do

  before do
    TimeEntry.delete_all
    @monday = Time.now.beginning_of_week
    @tuesday = @monday + 1.day
    @wednes = @tuesday + 1.day
    TimeEntry.create(time: @tuesday + 1.hours, minutes: 60)
    TimeEntry.create(time: @tuesday + 3.hours, minutes: 15)
    TimeEntry.create(time: @tuesday + 6.hours, minutes: 30)
    TimeEntry.create(time: @monday, minutes: 60)
    TimeEntry.create(time: @wednes + 16.hours, minutes: 60*3)
    TimeEntry.create(time: @wednes + 15.minutes, minutes: 60)

  end

  describe "for_date" do

    it "finds all entries for given day" do
      TimeEntry.for_date(@monday, :day).count.should == 1
      TimeEntry.for_date(@tuesday, :day).count.should == 3
      TimeEntry.for_date(@wednes, :day).count.should == 2
    end

    it "finds all entries for a given week" do
      TimeEntry.for_date(@monday).count.should == 6
      TimeEntry.for_date(@wednes).count.should == 6
    end

  end

end
