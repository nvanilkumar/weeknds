class GroupsController < ApplicationController
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @experienceparent = Experience.find(params[:parentexp])
    @status = 1
    @user = User.where(:firstname => 'surya')
    if current_usersecure
    @usersecure = current_usersecure
    else
      @usersecure = Usersecure.find_by_id(3)
    end
    if @group.isactive == 1
    if @group.usersecure_id == @usersecure.id 
      @status = 2
    elsif @group.grouptype == 'private'
      @status = 3
    else
    @status = 1
    end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    @invite = Invites.new
@experienceparent = Experience.find(params[:parentexp])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    
    @invite = Invites.new(:email=>params[:recipients])
    @group.user_id = 2 
    @group.enddate = '01/12/2012'
    @usersecure = current_usersecure
    @group.usersecure_id = @usersecure.id  
    
    respond_to do |format|
      if @group.save
         @invite.save
        @experience = Experience.find(@group.experience_id)
        @usersecure = Usersecure.find_by_id(@group.usersecure_id)
      #   UserMailer.registration_confirmation(@usersecure).deliver
        format.html { redirect_to @experience, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  # join group
  def joinGroup
  
  #  @group.user_id = 2 
  
  #  @experience = Experience.find(params[:experienceparent])
  #  @user = User.where(:firstname => 'surya')
  
     if current_usersecure
    @usersecure = current_usersecure
    else
      @usersecure = Usersecure.find_by_id(3)
    end
    @group = params[:group]
    @groupattend = Groupattends.new
    @groupattend.group_id = @group.id
    @usersecure = current_usersecure
    @groupattend.usersecure_id = @usersecure.id
     
    respond_to do |format|
      if @groupattend.save
        @experience = Experience.find_by_id(@group.experience_id)
        format.html { redirect_to @group, notice: 'Joined the Group' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
end
