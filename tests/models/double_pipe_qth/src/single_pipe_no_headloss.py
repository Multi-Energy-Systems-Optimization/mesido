from rtctools.util import run_optimization_problem

from mesido.qth_not_maintained.qth_mixin import HeadLossOption

if __name__ == "__main__":
    from double_pipe_qth import SinglePipeQTH
else:
    from .double_pipe_qth import SinglePipeQTH


class SinglePipeQTHNoHeadLoss(SinglePipeQTH):
    model_name = "SinglePipeQTH"

    def heat_network_options(self):
        options = super().heat_network_options()
        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        return options


if __name__ == "__main__":
    single_pipe_no_head_loss = run_optimization_problem(SinglePipeQTHNoHeadLoss)
