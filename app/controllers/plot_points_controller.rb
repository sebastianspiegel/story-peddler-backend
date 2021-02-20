class PlotPointsController < ApplicationController
    def index 
        plot_points = PlotPoint.all 
        render json: PlotPointSerializer.new(plot_points)
    end

    def show
        plot_point = PlotPoint.find(params[:id])
        render json: plot_point.to_json
    end

    def create
        plot_point = PlotPoint.new(plot_point_params)
        if plot_point.save
            render json: PlotPointSerializer.new(plot_point)
        else
            render json: {error: "failed to save"}
        end
    end

    def destroy
        plot_point = PlotPoint.find(params[:id])
        plot_point.destroy
        render json: {message: "plot point has been deleted"}
    end

    def update 
        plot_point = PlotPoint.find(params[:id])
        if plot_point.update(plot_point_params)
            render json: PlotPointSerializer.new(plot_point)
        else
            render json: {error: "failed to update"}
        end
    end

    private

    def plot_point_params
        params.require(:plot_point).permit(:description, :order, :story_id)
    end
end
